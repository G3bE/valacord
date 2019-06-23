// valacord © Nikolas Wipper 2019

using discord;

void main() {
	// Create a new API object
    var api = new API("NDkzMzgyOTU2NTAxNTY1NDQ0.XQ_Uwg.TT3hxsYdayvRpPPg0r7I8MMbsb4");
    // This is the channel_id. Make sure your bot has the permission to send messages to it
    int64 channel_id = 494188624842063872;
    // Now create the message
    api.create_message(channel_id, "Hello World!");
    yield;
}
