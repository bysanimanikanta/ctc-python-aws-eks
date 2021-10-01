# CTC PYTHON AWS EKS

This is a sample python project for AWS EKS deployments.

Resource exposed for consumption,

`/labday/greetings`

Returns a string by grabbing a value from environment variable and build properties `artifactId` & `version`.

## Local Development

1. Create virtual environment,

```
python -m venv venv
```

2. Activate virtual environment,

```
source venv/bin/activate
```

3. Install all the dependencies,

```
pip install -r requirements.txt
```

4. Run the application,

```
python app.py
```