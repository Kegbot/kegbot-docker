## Environment Variables

The container will run 

* `KEGBOT_ROOT`: Base data directory, should correspond to a volume exported
  by the docker host.  Default: `/kegbot-data`.
* `KEGBOT_DEBUG`: If present and evalutes to `True`, enables `DEBUG` mode in
  Kegbot settings.  Default: `False`.

