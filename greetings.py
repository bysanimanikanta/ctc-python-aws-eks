from flask import Flask
from flask_restplus import Resource, Api

import sys
import logging

app = Flask(__name__)
api = Api(app, prefix="/labday", title="CTC Lab Day")
ns = api.namespace("")
logging.basicConfig(stream=sys.stdout, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


@ns.route("/greet")
class Greetings(Resource):
    def get(self):
        """Greet with a message"""
        try:
            logging.info("Request received")
            return {
                "status": "success",
                "message": "Message from AWS: Hello, this is CTC Lab day!!! "
            }, 200
        except Exception:
            return {
                "message": "Internal Server Error. Please retry or contact admin."
            }, 500


if __name__ == '__main__':
    app.run()
