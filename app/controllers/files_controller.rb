require 'search_in_file' #using gem file

class FilesController < ApplicationController

  def new #define class
    if params[:path].to_s.length >0 #checking if a path has given
      @path = params[:path].to_s
      if params[:phrase].to_s.length>0 #checking if a word has given
        @phrase = params[:phrase].to_s
        hash_file = SearchInFile.search(@path, @phrase)  #Search for phrase in all documents and subfolders under path
        hash_file.each do ||
          pathname = hash_file[0][:file] #Getting path
          @arrayFilesAll = Array.new #Define new array
          @arrayFilesAll.append(pathname.to_s) #store path names in array
          if hash_file.size>0 #checking if any document available
            #Dir.chdir(@path)
            #hash_file = Dir.glob("**/*.{doc,docx,txt,pdf}", base: '')
            hash_file.each do ||
              #pathname = hash_file[0][:file]
              content = hash_file[0][:paragraphs].join(@path) #Getting paragraphs in document
              @message = "Got this path from user: " + @path.to_s #Output Message
              #@arrayFilesAll = Array.new
              @contents = Array.new #Define new array
              #@arrayFilesAll.append(pathname.to_s)
              @contents.append(content) #store paragraphs in array
            end
          else
            @message = "Nothing to show" #Output Message
          end
        end

      else
        @message =  "Please enter word phrase!" #Output Message
      end
    else
      @message = "Please enter Path!" #Output Message
    end

  end
end

#Shenal Madurawalage Don - S1498742
#Q3S1498742