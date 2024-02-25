#from flask import Flask, jsonify
#from flask_mongoengine import MongoEngine
#from flask.json import JSONEncoder
#from flask import JSONEncoder

from flask import Flask, jsonify, JSONEncoder
from flask_mongoengine import MongoEngine


app = Flask(__name__)
app.config['MONGODB_SETTINGS'] = {
    'db': 'resurge-courses',
    'host': 'mongodb+srv://lekhyam25:PBIWLOMz2GqBDOvN@resurge-courses.hdusfja.mongodb.net/'
}
db = MongoEngine(app)

class Course(db.Document):
    course_name = db.StringField(required=True)
    duration = db.StringField()
    category_subject = db.StringField()
    course_details_syllabus = db.StringField()
    course_instructor = db.StringField()
    course_provider = db.StringField()
    link = db.StringField()
    enrolled = db.BooleanField(default=False)
    certification = db.BooleanField(default=False)
    rating = db.FloatField(default=0.0)
    prerequisites = db.ListField(db.StringField())

@app.route('/courses', methods=['GET'])
def get_courses():
    courses = Course.objects()
    return jsonify({'courses': courses})

@app.route('/courses/<course_id>', methods=['GET'])
def get_course(course_id):
    course = Course.objects(id=course_id).first()
    if course:
        return jsonify({'course': course})
    else:
        return jsonify({'error': 'Course not found'}), 404

if __name__ == '__main__':
    app.run(debug=True)

