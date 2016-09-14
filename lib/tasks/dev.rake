# -*- encoding : utf-8 -*-
namespace :dev do
  desc "Rebuild system"
  task build: ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]

  desc "demo"
  task demo: :environment do
  end

  desc "extract_amazon_link"
  task extract_amazon_link: :environment do
    Book.all.each(&:extract_amazon_link!)
  end
end
