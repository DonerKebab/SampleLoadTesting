from locust import HttpLocust, TaskSet, task


class  WebsiteTasks(TaskSet):

    def on_start(self):
        """ Run on start for every Locust hatched """
        # set headers
        # self.client.headers['token'] = value
        ## ...

    @task
    def deals(self):
        endpoint = "/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1"
        self.client.request(method="GET", url=endpoint)


class LoadTesting(HttpLocust):
    task_set = WebsiteTasks
