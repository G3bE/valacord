// valacord © Nikolas Wipper 2019

namespace discord {

    public class HTTPS : Object {
        private Soup.Session session;
        private Json.Parser parser;

        private string URL = "https://discordapp.com/api/v";
        private string VERSION = "7";
        private string token;

        public HTTPS(string token) {
            this.session = new Soup.Session();
            this.parser = new Json.Parser();

            this.token = token;

            session.use_thread_context = true;
        }

        public async Json.Object * make_request(Endpoint endpoint, string body = "", Json.Object format) {
            string path = endpoint.path;
            string method = endpoint.method.to_string();
            try {
                format.foreach_member((object, member_name, member_node) => {
                        string node_value;
                        string type = member_node.type_name();
                        switch (type) {
                        case "string":
                            node_value = member_node.dup_string();
                            break;
                        case "Integer":
                            node_value = member_node.get_int().to_string();
                            break;
                        default:
                            throw new ParsingError.UnexpectedType(@"Unexpected type while formatting path ($type)");
                        }
                        path = path.replace(@"{$member_name}", node_value);
                    });

                var uri = @"$URL$VERSION$path";

                var session = new Soup.Session();
                var message = new Soup.Message(method, uri);

                message.request_headers.append("Authorization", @"Bot $token");
                message.request_headers.replace("User-Agent", "DiscordBot (v0.0.1)");
                message.request_headers.replace("Content-Type", "application/json");

                if (body.length > 0)
                {
                    var buffer = new Soup.Buffer.take(body.data);
                    message.request_body.append_buffer(buffer);
                }

                debug(@"Attempting $method request to $uri with body '$body'");

                session.send_message(message);
                var response = (string) message.response_body.flatten().data;

                debug(@"Endpoint responded with: '$response'");

                parser.load_from_data(response, -1);
                return parser.get_root().get_object();
            } catch (Error e) {
                string error = e.message;
                stderr.printf(@"Request to API endpoint $path failed with a uncaught exeption $error.");
            }
            return null;
        }
    }
}