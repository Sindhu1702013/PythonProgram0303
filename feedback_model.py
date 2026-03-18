from pydantic import BaseModel

class Feedback(BaseModel):
    project_id: str
    user_id: str
    message: str

    def get_project(self):
        return self.project_id