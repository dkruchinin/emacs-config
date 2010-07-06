(require 'project-types)
(require 'myede)

(my-cpp-root-project
 "T*-tree"
 :name "T*-tree"
 :file "~/development/projects/ttree/CMakeLists.txt"
 :local-variables '((c-indentation-style . "default")
                    (compile-command . "cd build; make -j3")))

(my-linux-project
 "cryptodev-2.6"
 :name "cryptodev-2.6"
 :file "~/work/cryptodev-2.6/Makefile"
 :local-variables '((c-basic-offset . 8)
                    (c-tab-width . 8)
                    (tab-width . 8)
                    (c-indentation-style . "linux")
                    (indent-tabs-mode . t)
                    (compile-command . "make -j3 bzImage"))
 :arch "x86")

(my-linux-project
 "linux-2.6"
 :name "linux-2.6"
 :file "~/work/linux/linux-2.6/Makefile"
 :local-variables '((c-basic-offset . 8)
                    (c-tab-width . 8)
                    (tab-width . 8)
                    (c-indentation-style . "linux")
                    (indent-tabs-mode . t)
                    (compile-command . "make -j3 bzImage"))
 :arch "x86")
