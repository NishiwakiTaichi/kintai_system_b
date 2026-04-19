# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 管理者ユーザーを作成
User.find_or_create_by!(email: "admin@example.com") do |user|                                                                     
  user.name       = "管理者 太郎"
  user.password   = "password"                                                                                                    
  user.department = "管理部"
  user.admin      = true                                                                                                          
end                                                                                                                               
   
# 一般ユーザーを5人作成                                                                                                           
5.times do |i|  
  User.find_or_create_by!(email: "user#{i + 1}@example.com") do |user|
    user.name       = "社員 #{i + 1}号"                                                                                           
    user.password   = "password"
    user.department = "開発部"                                                                                                    
    user.admin      = false                                                                                                       
  end
end  
