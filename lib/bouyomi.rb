require 'csv'

class BouyomiDic
  BOUYOMI_DIR = 'BouyomiChan'
  DIC_FILES = ['ReplaceStudy']

  attr_accessor :base_dir
  def initialize base_dir
    @base_dir = base_dir
    @dics = Hash.new
    load_files
  end

  def list_by_dic filename
    @dics[filename]
  end

  private
  def load_files
    DIC_FILES.each do |file|
      filename = File.join(@base_dir, BOUYOMI_DIR, "#{file}.dic")
      csv = CSV.open(filename, 'r', col_sep: '	')
      @dics[file.to_sym] = {
        list: nil,
        updated: nil,
      }
      @dics[file.to_sym][:updated] = File.mtime filename
      @dics[file.to_sym][:list] = csv.map do |row|
        {word: row[2],
         reading: row[3],
        }
      end
    end
  end
end
