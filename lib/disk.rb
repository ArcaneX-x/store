class Disk < Product
  attr_accessor :title, :year, :artist, :genre

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @artist = params[:artist]
    @genre = params[:genre]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true)

    self.new(
      title: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def to_s
    "Disk «#{@title}», #{@genre}, #{@year}, #{@artist}, #{super}"
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
    @artist = params[:artist] if params[:artist]
  end
end
