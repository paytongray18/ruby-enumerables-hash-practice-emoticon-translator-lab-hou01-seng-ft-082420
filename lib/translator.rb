require "yaml"
require 'pry'
#emoticons = YAML.load_file('emoticons.yml')

def load_library(path)
  emoticons = YAML.load_file(path)
  final_emote = {}
  emoticons.each do |name, array|
    final_emote[name] = {}
    final_emote[name][:english] = array[0]
    final_emote[name][:japanese] = array[1]
  end
  final_emote
end

def get_japanese_emoticon(library,eng_emote)
  library = load_library(library)
  library.each do |value, meaning|
    if library[value][:english] == eng_emote
      return library[value][:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(library, jap_emote)
  library = load_library(library)
  library.each do |value, meaning|
    if library[value][:japanese] == jap_emote
      return value
    end
  end
  "Sorry, that emoticon was not found"
end