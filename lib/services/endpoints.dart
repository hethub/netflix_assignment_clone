enum Endpoints {
  trandingMovies(path: '/trending/movie/day'),
  movieDetail(path: '/movie/'), //id
  video(path: '/videos'),
  ;

  final String path;
  const Endpoints({required this.path});
}
