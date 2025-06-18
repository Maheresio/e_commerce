import 'dart:typed_data';

import 'package:e_commerce/core/services/firestore_sevice.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/services/supabase_storage_service.dart';

abstract class SearchRemoteDataSource {
  Future<String> uploadImage(Uint8List bytes, String filePathInBucket);
  Future<List<String>> getClothesTags(String imageUrl);

  // Future<List<Product>> searchProductsByTags(List<String> tags);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final SupabaseStorageService storageService;
  final DioClient dioClient;
  final FirestoreServices firestore;

  SearchRemoteDataSourceImpl({
    required this.storageService,
    required this.dioClient,
    required this.firestore,
  });

  @override
  Future<String> uploadImage(Uint8List bytes, String filePathInBucket) async {
    return storageService.uploadImageFromBytes(
      bytes: bytes,
      filePathInBucket: filePathInBucket,
    );
  }

  @override
  Future<List<String>> getClothesTags(String imageUrl) async {
    final response = await dioClient.post(
      url: ApiConstants.getModelEndpoint(),
      headers: ApiConstants.headers,
      data: {
        "inputs": [
          {
            "data": {
              "image": {"url": imageUrl},
            },
          },
        ],
      },
    );

    if (response.statusCode == 200) {
      final outputs = response.data['outputs'];
      if (outputs != null && outputs.isNotEmpty) {
        final responseData = outputs[0]['data'];
        if (responseData != null && responseData.containsKey('concepts')) {
          final concepts = responseData['concepts'] as List;

          // Extract tag names
          return concepts
              .where((concept) => concept['value'] >= 0.8)
              .map<String>((concept) => concept['name'].toString())
              .toList();
        }
      }
    }

    return [];
  }
}
