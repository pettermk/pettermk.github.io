require 'rubygems'
require 'extlib'
require 'pathname'
require 'fileutils'
require 'nanoc3'
require "#{Dir.pwd}/lib/utils.rb"

include SiteUtils

namespace :site do
     task :tags do
     	  site = Nanoc3::Site.new('.')
    	  dir = Pathname(Dir.pwd)/'content/tags'
     	  tags = {}
     	  # Collect tag and page data
     	  site.items.each do |p|
     	  	next unless p.attributes[:tags]
     	  	p.attributes[:tags].each do |t|
     	  	     if tags[t]
     	  	          tags[t] = tags[t]+1
     	  	     else
		          tags[t] = 1
	  	     end
	       end
          end

     	  # Write pages
     	  tags.each_pair do |k, v|
               unless (dir/"#{k}.md").exist? then
	            puts "Creating tag page for '#{k}'"
	  	    write_tag_page dir, k, v
	  	    
               end
     	  end
     	  # Remove unused tags
     	  dir.children.each do |c|
               t = c.basename.to_s.gsub /(-(rss|atom))?\..+$/, ''
	       unless tags[t] then
	            puts "Deleting unused tag page '#{c.basename}'"
	            c.delete
	       end
	  end
     end
end