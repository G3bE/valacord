// valacord © Nikolas Wipper 2019

namespace discord {

	public class API : Object {
		private HTTPS https;
		private Json.Parser parser;

		public API(string token) {
			this.https = new HTTPS(token);
			this.parser = new Json.Parser();
		}

		// @TODO: more functions

		/**
		 * Create message
		 * ==============
		 * 
		 * Creates a message in a channel with the given id
		 * ------------------------------------------------
		 * @arg channel_id: ID of the channel that the message schould be sent to
		 * @arg content (optional): The message contents (up to 2000 characters)
		 * @arg nonce (optional): A nonce that can be used for optimistic message sending
		 * @arg tts (optional): True if this is a Text-to-Speech message
		 * @arg file (optional): The contents of the file being sent
		 * @arg embed (optional): Embedded rich content
		 * @note: Either content or embed must be passed
		 * @TODO: Accept JSON as embed
		 */
		public async void create_message(int64 channel_id, string content = "", int nonce = 0, bool tts = false, string file = "", string embed = "{}") {
			// This is used to format the enpoint (/channels/{channel_id}/messages)
			parser.load_from_data(@"{\"channel_id\": $channel_id}", -1);
			var format = parser.get_root().get_object();
			// Async main loop
			var loop = new MainLoop();

			var payload = @"{\"content\": \"$content\", \"nonce\": $nonce, \"tts\": $tts, \"file\": \"$file\", \"embed\": $embed}";

			// Enpoint, body and our format string
			yield this.https.make_request(CREATE_MESSAGE, payload, format);
		}

	}
}
