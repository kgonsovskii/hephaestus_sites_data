# hephaestus_sites_data

Dynamic Sites data (same idea as `hephaestus_data`). Sibling of the `hephaestus_sites` code repo:

```
parent/
  profile.txt
  hephaestus_sites/          ← code
  hephaestus_sites_data/     ← this repo
    default/
      sites.json
      settings.json
      wwwroot/
    gonzik/
      ...
```

The Sites host clones/pulls/pushes this repo. It does not git-sync the code repo from CP.
