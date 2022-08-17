import 'package:fluboard/data/datasource/remote/authenticated_client.dart';
import 'package:googleapis/photoslibrary/v1.dart';

class GooglePhotoService {
  PhotosLibraryApi _service() => PhotosLibraryApi(AuthenticatedClient());

  Future<ListAlbumsResponse> getAlbums() => _service().albums.list(pageSize: 50);
  Future<Album> getAlbum(String albumId) => _service().albums.get(albumId);
  Future<ListSharedAlbumsResponse> getSharedAlbums() => _service().sharedAlbums.list();
  Future<SearchMediaItemsResponse> search(String albumId) =>
      _service().mediaItems.search(SearchMediaItemsRequest(albumId: albumId, pageSize: 100));
}
