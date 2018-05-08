OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({"provider"=>"github",
                                                             "uid"=>"34108893",
                                                             "info"=>{"nickname"=>"testuser", "email"=>nil, "name"=>"Test User", "image"=>"https://avatars2.githubusercontent.com/u/34108893?v=4", "urls"=>{"GitHub"=>"https://github.com/anon0mys", "Blog"=>""}},
                                                             "credentials"=>{"token"=>"93a13c0e7730abddd9a46db5447d7954765fc68c", "expires"=>false},
                                                             "extra"=>
                                                              {"raw_info"=>
                                                                {"login"=>"testuser",
                                                                 "id"=>34108893,
                                                                 "name"=>"Test User",
                                                                 "created_at"=>"2017-11-29T20:54:51Z",
                                                                 "updated_at"=>"2018-03-26T19:02:12Z"}}
                                                             })
