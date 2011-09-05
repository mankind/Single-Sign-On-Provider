require 'spec_helper'

describe AuthController do

  describe "GET 'welcome'" do
    it "should be successful" do
      get 'welcome'
      response.should be_success
    end
  end

  describe "GET 'authorize'" do
    it "should be successful" do
      get 'authorize'
      response.should be_success
    end
  end

  describe "GET 'acess_token'" do
    it "should be successful" do
      get 'acess_token'
      response.should be_success
    end
  end

  describe "GET 'failure'" do
    it "should be successful" do
      get 'failure'
      response.should be_success
    end
  end

  describe "GET 'use'" do
    it "should be successful" do
      get 'use'
      response.should be_success
    end
  end

  describe "GET 'isalive'" do
    it "should be successful" do
      get 'isalive'
      response.should be_success
    end
  end

  describe "GET 'application'" do
    it "should be successful" do
      get 'application'
      response.should be_success
    end
  end

end
