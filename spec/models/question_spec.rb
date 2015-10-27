require 'rails_helper'

describe List do
  it { should validate_presence_of :firstOption }
  it { should validate_presence_of :secondOption }
end
