// valacord © Nikolas Wipper 2019

namespace discord {
	public errordomain ParsingError {
		UnexpectedType
	}

	public errordomain HTTPError {
		RequestFailed,
		RateLimited
	}
}
