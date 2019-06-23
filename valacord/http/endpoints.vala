// valacord © Nikolas Wipper 2019

namespace discord {

	public struct Endpoint {
		Method method;
		string path;
	}

	public enum Method {
		GET,
		POST,
		PUT,
		PATCH,
		DELETE;

		public string to_string() {
			switch (this) {
				case GET:
					return "GET";

				case POST:
					return "POST";

				case PUT:
					return "PUT";

				case PATCH:
					return "PATCH";

				case DELETE:
					return "DELETE";

				default:
					assert_not_reached();
			}
		}
	}

	// bUt ThIs WaY oF iNdEnTaTiOn Is iLlEgAl

	// -------------------- GATEWAY --------------------

	public const Endpoint GET_GATEWAY                   = {Method.GET,    "/gateway"};

	// -------------------- AUDIT LOG --------------------
	public const Endpoint GET_AUDIT_LOG                 = {Method.GET,    "/guilds/{guild_id}/audit-logs"};

	// -------------------- CHANNEL --------------------
	private const string CHANNEL                        = "/channels/{channel_id}";
	private const string CHANNEL_MESSAGE                = CHANNEL + "/messages/{message_id}";
	private const string CHANNEL_MESSAGE_REACTION       = CHANNEL_MESSAGE + "/reactions/{emoji}";
	private const string CHANNEL_PERMISSION             = CHANNEL + "permissions/{overwrite_id}";
	private const string CHANNEL_PIN                    = CHANNEL + "/pins/{message_id}";
	private const string DM_CHANNEL_RECIPIENT           = CHANNEL + "/recipients/{user_id}";

	public const Endpoint GET_CHANNEL                   = {Method.GET,    CHANNEL};
	public const Endpoint MODIFY_CHANNEL                = {Method.PATCH,  CHANNEL};
	public const Endpoint DELETE_CHANNEL                = {Method.DELETE, CHANNEL};

	public const Endpoint GET_CHANNEL_MESSAGES          = {Method.GET,    CHANNEL + "/messages"};
	public const Endpoint CREATE_MESSAGE                = {Method.POST,   CHANNEL + "/messages"};
	
	public const Endpoint BULK_DELETE_MESSAGES          = {Method.POST,   CHANNEL + "/messages/bulk-delete"};
	
	public const Endpoint GET_CHANNEL_MESSAGE           = {Method.GET,    CHANNEL_MESSAGE};
	public const Endpoint EDIT_MESSAGE                  = {Method.PATCH,  CHANNEL_MESSAGE};
	public const Endpoint DELETE_MESSAGE                = {Method.DELETE, CHANNEL_MESSAGE};
	
	public const Endpoint DELETE_ALL_REACTIONS          = {Method.DELETE, CHANNEL_MESSAGE + "/reactions"};
	public const Endpoint CREATE_REACTION               = {Method.PUT,    CHANNEL_MESSAGE_REACTION + "/@me"};
	public const Endpoint DELETE_OWN_REACTION           = {Method.DELETE, CHANNEL_MESSAGE_REACTION + "/@me"};
	public const Endpoint DELETE_USER_REACTION          = {Method.DELETE, CHANNEL_MESSAGE_REACTION + "/{user_id}"};
	public const Endpoint GET_REACTIONS                 = {Method.GET,    CHANNEL_MESSAGE_REACTION};
	
	public const Endpoint EDIT_CHANNEL_PERMISSIONS      = {Method.PUT,    CHANNEL_PERMISSION};
	public const Endpoint DELETE_CHANNEL_PERMISSIONS    = {Method.DELETE, CHANNEL_PERMISSION};
	
	public const Endpoint GET_CHANNEL_INVITES           = {Method.GET,    GUILD + "/invites"};
	public const Endpoint CREATE_CHANNEL_INVITE         = {Method.POST,   GUILD + "/invites"};
	
	public const Endpoint TRIGGER_TYPING_INDICATOR      = {Method.POST,   GUILD + "/typing"};
	
	public const Endpoint GET_PINNED_MESSAGES           = {Method.GET,    GUILD + "/pins"};
	public const Endpoint ADD_PINNED_MESSAGE            = {Method.PUT,    CHANNEL_PIN};
	public const Endpoint DELETE_PINNED_MESSAGE         = {Method.DELETE, CHANNEL_PIN};
	
	public const Endpoint ADD_GROUP_DM_RECIPIENT        = {Method.PUT,    DM_CHANNEL_RECIPIENT};
	public const Endpoint REMOVE_GROUP_DM_RECIPIENT     = {Method.DELETE, DM_CHANNEL_RECIPIENT};
	
	// -------------------- EMOJI --------------------
	private const string GUILD                          = "/guilds/{guild_id}";
	private const string GUILD_EMOJI                    = GUILD + "/emojis/{emoji_id}";

	public const Endpoint LIST_GUILD_EMOJIS             = {Method.GET,    GUILD + "/emojis"};
	public const Endpoint CREATE_GUILD_EMOJI            = {Method.POST,   GUILD + "/emojis"};
	
	public const Endpoint GET_GUILD_EMOJI               = {Method.GET,    GUILD_EMOJI};
	public const Endpoint MODIFY_GUILD_EMOJI            = {Method.PATCH,  GUILD_EMOJI};
	public const Endpoint DELETE_GUILD_EMOJI            = {Method.DELETE, GUILD_EMOJI};
	
	// -------------------- GUILD --------------------
	private const string GUILD_MEMBER                   = GUILD + "/members/{user_id}";
	private const string GUILD_ROLE                     = GUILD + "/roles/{role_id}";
	private const string GUILD_MEMBER_ROLE              = GUILD_MEMBER + "/roles/{role_id}";
	private const string GUILD_BAN                      = GUILD + "/bans/{user_id}";
	private const string GUILD_INTEGRATION              = GUILD + "/integrations/{integration_id}";

	public const Endpoint CREATE_GUILD                  = {Method.POST,   "/guilds"};
	
	public const Endpoint GET_GUILD                     = {Method.GET,    GUILD};
	public const Endpoint MODIFY_GUILD                  = {Method.PATCH,  GUILD};
	public const Endpoint DELETE_GUILD                  = {Method.DELETE, GUILD};
	
	public const Endpoint GET_GUILD_CHANNELS            = {Method.GET,    GUILD + "/channels"};
	public const Endpoint CREATE_GUILD_CHANNEL          = {Method.POST,   GUILD + "/channels"};
	public const Endpoint MODIFY_GUILD_CHANNEL_POSITION = {Method.PATCH,  GUILD + "/channels"};
	
	public const Endpoint LIST_GUILD_MEMBERS            = {Method.GET,    GUILD + "/members"};
	
	public const Endpoint GET_GUILD_MEMBER              = {Method.GET,    GUILD_MEMBER};
	public const Endpoint ADD_GUILD_MEMBER              = {Method.PUT,    GUILD_MEMBER};
	public const Endpoint MODIFY_GUILD_MEMBER           = {Method.PATCH,  GUILD_MEMBER};
	public const Endpoint REMOVE_GUILD_MEMBER           = {Method.DELETE, GUILD_MEMBER};
	
	public const Endpoint MODIFY_CURRENT_USER_NICK      = {Method.PATCH,  GUILD + "/members/@me/nick"};
	
	public const Endpoint GET_GUILD_ROLES               = {Method.GET,    GUILD + "/roles"};
	public const Endpoint CREATE_GUILD_ROLE             = {Method.POST,   GUILD + "/roles"};
	public const Endpoint MODIFY_GUILD_ROLE_POSITION    = {Method.PATCH,  GUILD + "/roles"};
	
	public const Endpoint MODIFY_GUILD_ROLE             = {Method.PATCH,  GUILD_ROLE};
	public const Endpoint DELETE_GUILD_ROLE             = {Method.DELETE, GUILD_ROLE};
	
	public const Endpoint ADD_GUILD_MEMBER_ROLE         = {Method.PUT,    GUILD_MEMBER_ROLE};
	public const Endpoint REMOVE_GUILD_MEMBER_ROLE      = {Method.DELETE, GUILD_MEMBER_ROLE};
	
	public const Endpoint GET_GUILD_BANS                = {Method.GET,    GUILD + "/bans"};
	
	public const Endpoint GET_GUILD_BAN                 = {Method.GET,    GUILD_BAN};
	public const Endpoint CREATE_GUILD_BAN              = {Method.PUT,    GUILD_BAN};
	public const Endpoint REMOVE_GUILD_BAN              = {Method.DELETE, GUILD_BAN};
	
	public const Endpoint GET_GUILD_PRUNE_COUNT         = {Method.GET,    GUILD + "/prune"};
	public const Endpoint BEGIN_GUILD_PRUNE             = {Method.POST,   GUILD + "/prune"};
	
	public const Endpoint GET_GUILD_VOICE_REGIONS       = {Method.GET,    GUILD + "/regions"};
	
	public const Endpoint GET_GUILD_INVITES             = {Method.GET,    GUILD + "/invites"};
	
	public const Endpoint GET_GUILD_INTEGRATIONS        = {Method.GET,    GUILD + "/integrations"};
	public const Endpoint CREATE_GUILD_INTEGRATIONS     = {Method.POST,   GUILD + "/integrations"};
	
	public const Endpoint MODIFY_GUILD_INTEGRATION      = {Method.PATCH,  GUILD_INTEGRATION};
	public const Endpoint DELETE_GUILD_INTEGRATION      = {Method.DELETE, GUILD_INTEGRATION};
	
	public const Endpoint SYNC_GUILD_INTEGRATION        = {Method.POST,   GUILD_INTEGRATION + "/sync"};
	
	public const Endpoint GET_GUILD_EMBED               = {Method.GET,    GUILD + "/embed"};
	public const Endpoint MODIFY_GUILD_EMBED            = {Method.PATCH,  GUILD + "/embed"};
	
	public const Endpoint GET_GUILD_VANITY_URL          = {Method.GET,    GUILD + "/vanity-url"};
	
	public const Endpoint GET_GUILD_WIDGET_IMAGE        = {Method.GET,    GUILD + "/widget.png"};

	// -------------------- INVITE --------------------
	private const string INVITE                         = "/invites/{invite_code}";

	public const Endpoint GET_INVITE                    = {Method.GET,    INVITE};
	public const Endpoint DELETE_INVITE                 = {Method.DELETE; INVITE};

	// -------------------- USER --------------------
	private const string USER                           = "/users/{user_id}";
	private const string USER_GUILD                     = "/users/@me/guilds/{guild_id}";

	public const Endpoint GET_USER                      = {Method.GET,    USER};

	public const Endpoint GET_CURRENT_USER              = {Method.GET,    "/users/@me"};
	public const Endpoint MODIFY_CURRENT_USER           = {Method.PATCH,  "/users/@me"};

	public const Endpoint GET_CURRENT_USER_GUILDS       = {Method.GET,    "/users/@me/guilds"};

	public const Endpoint LEAVE_GUILD                   = {Method.DELETE, USER_GUILD};

	public const Endpoint GET_USER_DMS                  = {Method.GET,    "/users/@me/channels"};
	public const Endpoint CREATE_DM                     = {Method.POST,   "/users/@me/channels"};
	public const Endpoint CREATE_GROUP_DM               = {Method.POST,   "/users/@me/channels"};

	public const Endpoint GET_USER_CONNECTIONS          = {Method.GET,    "/users/@me/connections"};

	// -------------------- VOICE --------------------

	public const Endpoint LIST_VOICE_REGIONS            = {Method.GET,    "/voice/regions"};

	// -------------------- WEBHOOK --------------------
	public const string WEBHOOK                         = "/webhooks/{webhook_id}";
	public const string WEBHOOK_TOKEN                   = WEBHOOK + "/{webhook_token}";

	public const Endpoint CREATE_WEBHOOK                = {Method.POST,   CHANNEL + "/webhooks"};
	public const Endpoint GET_CHANNEL_WEBHOOK           = {Method.GET,    CHANNEL + "/webhooks"};

	public const Endpoint GET_GUILD_WEBHOOKS            = {Method.GET,    GUILD + "/webhooks"};

	public const Endpoint GET_WEBHOOK                   = {Method.GET,    WEBHOOK};
	public const Endpoint MODIFY_WEBHOOK                = {Method.PATCH,  WEBHOOK};
	public const Endpoint DELETE_WEBHOOK                = {Method.DELETE, WEBHOOK};

	public const Endpoint GET_WEBHOOK_WITH_TOKEN        = {Method.GET,    WEBHOOK_TOKEN};
	public const Endpoint MODIFY_WEBHOOK_WITH_TOKEN     = {Method.PATCH,  WEBHOOK_TOKEN};
	public const Endpoint DELETE_WEBHOOK_WITH_TOKEN     = {Method.DELETE, WEBHOOK_TOKEN};
	public const Endpoint EXECUTE_WEBHOOK               = {Method.POST,   WEBHOOK_TOKEN};

	public const Endpoint EXECUTE_SLACK_WEBHOOK         = {Method.POST,   WEBHOOK_TOKEN + "/slack"};
	public const Endpoint EXECUTE_GITHUB_WEBHOOK        = {Method.POST,   WEBHOOK_TOKEN + "/github"};
}
