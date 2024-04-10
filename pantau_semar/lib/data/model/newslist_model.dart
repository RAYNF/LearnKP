class newsList {
  String author;
  String judul;
  String tanggal;
  String description;
  String urlImage;

  newsList(
      {required this.author,
      required this.judul,
      required this.tanggal,
      required this.description,
      required this.urlImage});
}

var newsListSemarang = [
  newsList(
      author: "ANTARA",
      judul:
          "OpenAI dikabarkan menggunakan video YouTube untuk melatih AI buatannya",
      tanggal: "2024-04-08",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      urlImage:
          "https://img.antaranews.com/cache/1200x800/2024/01/07/2024-01-05T214415Z_4_LYNXMPEK040NV_RTROPTP_4_OPENAI-MICROSOFT-NEW-YORK-TIMES.jpg.webp"),
  newsList(
      author: "CNN INDONESIA",
      judul: "Kasus Pertama Pasien Virus B Ditemukan di Hong Kong",
      tanggal: "2024-04-07",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      urlImage:
          "https://akcdn.detik.net.id/visual/2016/02/09/491fd983-bcda-4e90-90a5-93186fd87c58_169.jpg?w=650&q=90"),
  newsList(
      author: "detikInet",
      judul: "Seberapa Berguna Kipas Angin di Cuaca Panas",
      tanggal: "2024-04-07",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      urlImage:
          "https://akcdn.detik.net.id/community/media/visual/2019/07/05/58c300ad-d49f-4b0b-afda-055f755a7401.jpeg?w=700&q=90"),
  newsList(
      author: "detikInet",
      judul: "Seberapa Berguna Kipas Angin di Cuaca Panas",
      tanggal: "2024-04-07",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      urlImage:
          "https://akcdn.detik.net.id/community/media/visual/2019/07/05/58c300ad-d49f-4b0b-afda-055f755a7401.jpeg?w=700&q=90")
];
