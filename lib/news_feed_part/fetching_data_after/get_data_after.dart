<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:47825b180948c63c96a27595b10c158567e68ea27a04959d06421069a0c4a080
size 579
=======
import 'package:intra_media/news_feed_part/fetching_from_api/fetching_data.dart';
import 'package:intra_media/news_feed_part/model/news_chanals.dart';

class fetch_data_after {
  final _rep = fetching_data();
  Future<My_api_data_for_fetch> fetchNewChannelHeadlineApi(String news_key) async {
    final response = await _rep.fetchNewChannelHeadlineApi(news_key);
    return response;
  }
  Future<My_api_data_for_fetch> fetchNewsCatagoryModel(String catagory) async {
    final response = await _rep.fetchNewChannelHeadlineApi(catagory);
    return response;
  }
}
>>>>>>> master
