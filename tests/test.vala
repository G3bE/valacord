// valacord © Nikolas Wipper 2019

using discord;

void main() {
	var loop = new MainLoop();
	// Create a new API object
    var api = new API("<TOKENHERE>");
    // This is the channel_id. Make sure your bot has the permission to send messages to it
    int64 channel_id = 494188624842063872;
    // Now create the message
    api.create_message.begin(channel_id, "Hello World!", 0, false, "", "{}", (obj, res) => {
    	Message msg = api.create_message.end(res);
    	string content = msg.content;
    	stdout.printf(@"Content : $content\n");
    	loop.quit();
    });
    loop.run();
}
