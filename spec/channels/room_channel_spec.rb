require "rails_helper"

RSpec.describe RoomChannel, type: :channel do
  before do
    # initialize connection with identifiers
    stub_connection user_id: 1
  end

  it "subscribes without streams when no room id" do
    subscribe

    expect(subscription).to be_confirmed
    expect(subscription).not_to have_streams
  end

  it "subscribes to a stream when room id is provided" do
    subscribe({room: 1})

    expect(subscription).to be_confirmed

    # check particular stream by name
    expect(subscription).to have_stream_from(Room.find(1))

    # or directly by model if you create streams with `stream_for`
    expect(subscription).to have_stream_for(Room.find(1))
  end
end