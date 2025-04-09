To generate object file with TripoSR use this command:

```shell
.tripo-env/bin/python run.py examples/chair.png --output-dir output/{task-id}
```

To generate texture from object:

```shell
.tripo-texture-env/bin/python text2texture.py --obj-path output/{task-id}/0/mesh.obj --description "foobar" --output-dir output/{task-id}
```