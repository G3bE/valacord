// valacord © Nikolas Wipper 2019

using discord;

void main() {
	// Create new HTTPS client
    var test = new HTTPS("NDkzMzgyOTU2NTAxNTY1NDQ0.XQ_Uwg.TT3hxsYdayvRpPPg0r7I8MMbsb4");

    // Shortest way to create a new JSON object i guess
    var parser = new Json.Parser();
    parser.load_from_data("""{"channel_id": 494188624842063872}""", -1);
    var format = parser.get_root().get_object();
    // Async main loop
    var loop = new MainLoop();

    test.make_request.begin(CREATE_MESSAGE, """{"content": "Hello World"}""", format);
    yield;
}
