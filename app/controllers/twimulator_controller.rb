class TwimulatorController < ApplicationController
    require 'time'
    require 'rubygems'
    require 'hashie'
    require 'twitter'

    def new
      flash[:notice] = ""
    end

    def find
        #1: getting input user's friends_count.
        #user = Twitter.user("iwhurtafly")
        user = Twitter.user(params[:search_string1])
        user_friends_count = user.friends_count
        
        #2: getting input user's all friend_ids.
        #friend_ids = Twitter.friend_ids("iwhurtafly")
        friend_ids = Hash.new
        friend_ids = Twitter.friend_ids(params[:search_string1])
        
        ids = Array.new
        ids = friend_ids["ids"]
        
        i = 0
        users = Array.new
        cnt = user_friends_count / 100
        cnt.times do |cnt|
          users.concat Twitter.users(ids[i..i + 99])
          i = i + 100
        end
        mod = (user_friends_count % 100) - 1
        users.concat Twitter.users(ids[i..i + mod])

        #3: getting input user's all friend info.
        #users = Array.new
        #users = Twitter.users(friend_ids["ids"])
        
        #4: updateing array with user's all friend info.
        @user = Array.new
        i = 0
        user_friends_count.times do |i|
          begin            
            @user.push(["#{users[i].attrs['profile_image_url_https']}", "#{users[i].attrs['name']}", "#{users[i].attrs['screen_name']}", "#{users[i].attrs['description']}"])
          rescue Twitter::Error::NotFound
            flash[:notice] = 'We couldn\'t find that user...'
          rescue Twitter::Error::BadGateway, Twitter::Error::BadRequest, Twitter::Error::EnhanceYourCalm, Twitter::Error::Forbidden, Twitter::Error::InternalServerError, Twitter::Error::NotAcceptable, Twitter::Error::ServiceUnavailable, Twitter::Error::Unauthorized
            flash[:notice] = 'Maybe Twitter is down...'
          end          
        end
        
    end

    def show
      flash[:notice] = ""
      begin
        tweets = Array.new
        i = 0
        params[:counter].to_i.times do |i|
          Twitter.user_timeline(params["#{:search_string}" + i.to_s]).each do |twitter|
          #Twitter.user_timeline("iwhurtafly").each do |twitter|
            text = twitter['text']
            #if text =~ /^@#{params[:search_string2]}\s/
              tweets.push(["#{twitter['created_at']}", "#{twitter['text']}"])
            #end
            i += 1
          end
        end
      rescue Twitter::Error::BadGateway, Twitter::Error::BadRequest, Twitter::Error::EnhanceYourCalm, Twitter::Error::Forbidden, Twitter::Error::InternalServerError, Twitter::Error::NotAcceptable, Twitter::Error::NotFound, Twitter::Error::ServiceUnavailable, Twitter::Error::Unauthorized
        flash[:notice] = 'Maybe Twitter is down... Or check the name you input.'
      end

      twimulator = tweets
      #sometimes tweets returns the same result. so, not [+] but [|] is preferable.
      #twimulator.uniq!
      #twimulator.sort!
      @twimulator = twimulator
      
    end

end
