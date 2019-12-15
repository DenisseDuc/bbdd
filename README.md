Al igual que en la práctica anterior, la hice yo sola. Se utilizan los mismos comandos para crear el repositorio remoto hasta llegar al punto de interés, en el cual uno de los usuarios ha de mezclar los cambios realizados en el mismo fichero:

Desde un usuario subí los cambios realizados en el archivo bbdd2.sql, y procedo a hacer lo siguiente con el otro usuario, pero se produce un error:

error: failed to push some refs to 'https://github.com/DenisseDuc/bbdd.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

Por lo que utilizo el comando sugerido por el terminal, apareciendo un nuevo error:

-git pull https://github.com/DenisseDuc/bbdd.git master


 * branch            master     -> FETCH_HEAD
Auto-merging bbdd2.sql
CONFLICT (content): Merge conflict in bbdd2.sql
Automatic merge failed; fix conflicts and then commit the result.

Git indica cuál es el archivo en conflicto, por lo que procedí de la siguiente manera:

-git checkout --theirs bbdd2.sql

solucionando el problema, añadi el archivo, hice un commit y un push, sin ningún problema.



Denisse Duche
