from flask import Flask
from flask_restplus import Resource, Api

import sys
import logging
import os

app = Flask(__name__)
MESSAGE_FROM = os.environ["MESSAGE_FROM", "DEFAULT"]
api = Api(app, prefix="/labday", title="CTC Lab Day")
ns = api.namespace("")
logging.basicConfig(stream=sys.stdout, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


@ns.route("/greetings")
class Greetings(Resource):
    def get(self):
        """Greet with a message"""
        try:
            logging.info("Message from " + MESSAGE_FROM + ": Hello Python Lovers, this is CTC Lab day!!!")
            return {
                "status": "success",
                "message": "Message from " + MESSAGE_FROM + ": Hello Python Lovers, this is CTC Lab day!!!"
            }, 200
        except Exception:
            return {
                "message": "Internal Server Error. Please retry or contact admin."
            }, 500


if __name__ == '__main__':
    app.run()
