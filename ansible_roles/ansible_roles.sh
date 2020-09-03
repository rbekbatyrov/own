#!/bin/bash
mkdir -p ./inventories/{test,stagging,prod} ./playbooks
mkdir -p ./roles/[testrole]/{default,files,handlers,meta,tasks,templates,vars}
touch ./roles/[testrole]/{default,handlers,meta,tasks,vars}/main.yml
