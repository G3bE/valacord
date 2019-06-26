// valacord © Nikolas Wipper 2019

namespace discord {
	public class Snowflake {
		private uint64 _id;

		private int64 _timestamp;
		private DateTime _datetime;

		private int _worker_id;
		private int _process_id;

		private int _increment;

		public Snowflake(uint64 id) {
			this._id = id;

			this._timestamp = (int64) ((id >> 22) + 1420070400000);
			this._datetime = new DateTime.from_unix_utc(this._timestamp);

			this._worker_id = (int)((id & 0x3E0000) >> 17);
			this._process_id = (int)((id & 0x1F000) >> 12);

			this._increment = (int)(id & 0xFFF);
		}

		public uint64 id {
			get { return this._id; }
		}

		public int64 timestamp {
			get { return this._timestamp; }
		}

		public DateTime datetime {
			get { return this._datetime; }
		}

		public int worker_id {
			get { return this._worker_id; }
		}

		public int process_id {
			get { return this._process_id; }
		}

		public int increment {
			get { return this._increment; }
		}
	}
}