from datetime import datetime
import json
import os

DATE_FORMAT = "%Y-%m-%dT%H:%M:%S"

def dumps(*args, **kwargs):
    def _date_handler(obj):
        if hasattr(obj, 'strftime'):
            return obj.strftime(DATE_FORMAT)
        return obj
    return json.dumps(*args, default=_date_handler, **kwargs)

def loads(*args, **kwargs):
    def _date_decoder(dct):
        for k, v in dct.items():
            if isinstance(v, str):
                try:
                    dct[k] = datetime.strptime(v, DATE_FORMAT)
                except:
                    pass
        return dct
    return json.loads(*args, object_hook=_date_decoder, **kwargs)

cachedir = os.path.expanduser("~/.cache/kotd/")
if not os.path.exists(cachedir):
    os.makedirs(cachedir)
config_file = os.path.expanduser("~/.config/kotd.json")

def load_config():
    if os.path.exists(config_file):
        with open(config_file) as f:
            config = loads(f.read())
    else:
        config = {
            "start_date": datetime.utcnow(),
            # Number of kanji to show each day (not including review)
            "daily_kanji": 10,
            # Number of new kanji to show each day
            "new_kanji": 3,
            # Number of randomly old kanji to review each day
            "review_kanji": 3,
            # Maximum words to use with each day's kanji
            "max_words": 5,
            # Amount of time to show a word for before cycling to the next (seconds)
            "word_time": 300,
        }
        with open(config_file, "w") as f:
            f.write(dumps(config))
    return config
