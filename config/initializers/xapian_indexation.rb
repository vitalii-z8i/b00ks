require 'xapian_fu'
include XapianFu

$xap_books = XapianDb.new(:dir => 'book.db', :create => true)
$xap_chapter = XapianDb.new(:dir => 'chapter.db', :create => true)
Book.all.each    { |p| $xap_books << p.attributes }
Chapter.all.each { |p| $xap_chapter << p.attributes }
