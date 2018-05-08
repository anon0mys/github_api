OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({"provider"=>"github",
                                                             "uid"=>"34108893",
                                                             "credentials"=>{"token"=>ENV['GITHUB_USER_TOKEN']},
                                                             "extra"=>
                                                              {"raw_info"=>
                                                                {"login"=>"testuser",
                                                                 "name"=>"Test User",
                                                                 "created_at"=>"2017-11-29T20:54:51Z",
                                                                 "updated_at"=>"2018-03-26T19:02:12Z"}}
                                                             })
