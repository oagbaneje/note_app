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

    def initialize(author, note_list = {})
      @author = author
      @note_list = note_list
    end

=begin
create(note_content) - This function takes the note content as the parameter and
adds it to the notes list of the object.
=end
    def create(note_index,note_content)

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

    end
=begin
get(note_id) - This function takes a note_id which refers to the index of the note in
the notes list and returns the content of that note as a string.
=end
    def get(note_id)

    end
=begin
search(search_text) - This function takes a search string, search_text and returns all
the notes with that text within it in the following format
Showing results for search ‘[<search_text>]’
Note ID: [note_id]
[NOTE_CONTENT]


By Author [author]
=end
    def search(search_text)


    end
=begin
delete(note_id) - This function deletes the note at the index note_id of the notes list.
=end
    def delete(note_id)

    end
=begin
edit(note_id, new_content) - This function replaces the content in the note at
note_id with new_content
=end
    def edit(note_id, new_content)


    end
  end
end

writer = Document::NotesApplication.new("Obiamaka")
puts writer.author
