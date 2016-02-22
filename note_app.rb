=begin
1. Create a class classed NotesApplication . Use modules for namespacing.
2. Create a constructor that does the following
a. Takes in a parameter author as the author of the note and saves this as an instance
variable.
b. Create a notes list to store all the notes as an instance property.
=end

module Document
  class NotesApplication
    attr_reader :author
    attr_accessor :note_list

    def initialize(author="anonymous", note_list = {})
      puts "Welcome to NoteApp 1.0"
      puts "What is your name?"
      @author = gets.chomp
      @note_list = note_list
      options
    end

    def options
      puts  "NoteApp 1.0"
      puts  "Note options"
      puts  "---------------------"
      puts  "|1. Create Note      |"
      puts  "---------------------"
      puts  "|2. List of Notes    |"
      puts  "---------------------"
      puts  "|3. Get Note         |"
      puts  "---------------------"
      puts  "|4. Search Note List |"
      puts  "---------------------"
      puts  "|5. Delete           |"
      puts  "---------------------"
      puts  "|6. Edit             |"
      puts  "---------------------"
      puts  "|7. Quit             |"
      puts  "---------------------"
      choose_option = gets.chomp
      case choose_option
      when "1" then create
      when "2" then list
      when "3" then get
      when "4" then search
      when "5" then delete
      when "6" then edit
      when "7" then quit
      else
        puts "This option does not exist, check options again"
        options
      end
    end

=begin
create(note_content) - This function takes the note content as the parameter and
adds it to the notes list of the object.
=end
    def create
      puts "What do you want to name your Note?"
      note_index = gets.chomp
      puts "Type in the note contents"
      note_content = gets.chomp
      note_list[note_index] = {"note"=> note_content, "author"=> author}
      options
    end
=begin
list() - This function lists out each of the notes in the notes list in the following format.
The note_id parameter below represents the respective index of each of the items in the
list, the NOTE_CONTENT represent the note content and the author represents the note
author.
Note ID: [note_id]
[NOTE_CONTENT]


By Author [author]
=end
    def list
      return "There are no notes." if note_list.empty?
      note_list.each do |note_id, value|
        return "Note ID: #{note_id} \n #{value["note"]}\n\n\n By Author #{value["author"]}\n\n"
      end
      options
    end
=begin
get(note_id) - This function takes a note_id which refers to the index of the note in
the notes list and returns the content of that note as a string.
=end
    def get
      print "Type the Note ID:"
      note_id = gets.chomp
      puts "Getting note contents..."
      if note_list[note_id]
        note_list[note_id].each do |key, value|
          return value if key == "note"
        end
      else
        return "This Note does not exist!"
      end
      options
    end
=begin
search(search_text) - This function takes a search string, search_text and returns all
the notes with that text within it in the following format
Showing results for search ‘[<search_text>]’
Note ID: [note_id]
[NOTE_CONTENT]


By Author [author]
=end
    def search
      puts "Search:"
      search_text = gets.chomp
      puts "Showing results for search '#{search_text}'"
      downcase_search = search_text.downcase
      note_list.each do |key, value|
        downcase_note = note_list[key]["note"].downcase
        if downcase_note.include?(downcase_search)
          return "Note ID: #{key} \n #{value["note"]}\n\n\n By Author #{value["author"]}\n\n"
        else
          return "Note not found!"
        end
      end
      options
    end
=begin
delete(note_id) - This function deletes the note at the index note_id of the notes list.
=end
    def delete
      puts "Please type note to be deleted:"
      note_id = gets.chomp
      if note_list[note_id]
        note_list.delete(note_id)
      else
        "This Note does not exist!"
      end
      options
    end
=begin
edit(note_id, new_content) - This function replaces the content in the note at
note_id with new_content
=end
    def edit(note_id, new_content)
      if note_list[note_id]
        note_list[note_id].each_key do |key|
          note[key] = new_content if key == "note"
        end
      else
        "This Note does not exist!"
      end
      options
    end

    def quit
      puts "Are you sure you want to quit y/n"
      answer = gets.chomp
      if answer == "y" || answer =="Y"
        return
      elsif answer =="n" || answer== "N"
        options
      end
    end
  end
end

writer = Document::NotesApplication.new


require 'rspec'

RSpec.describe "NotesApplication" do



end
