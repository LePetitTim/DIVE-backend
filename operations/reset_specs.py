#!/usr/bin/python

from dive.base.core import create_app, db
app = create_app()

from dive.base.db.models import Spec

with app.app_context():
    all_specs = Spec.query.all()
    map(db.session.delete, all_specs)
    db.session.commit()