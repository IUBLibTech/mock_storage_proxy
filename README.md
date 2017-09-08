# mock_storage_proxy
`bundle install`

In a dedicated terminal:

`rackup -p 4567`

Test:
```
curl localhost:4567/
Some default response goes here

curl localhost:4567/status/id
[{"response":"Some response status for id goes here"}]

curl localhost:4567/stage/id
[{"response":"Some response indicating stage request received for id goes here"}]

curl localhost:4567/unstage/id
[{"response":"Some response indicating unstage request received for id goes here"}]
```