require "jekyll-import";
JekyllImport::Importers::WordpressDotCom.run({
  "source" => "./WordPress.2021-12-24.xml",
  "no_fetch_images" => false,
  "assets_folder" => "assets/images"
})
