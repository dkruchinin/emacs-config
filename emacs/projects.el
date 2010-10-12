(require 'project-types)
(require 'myede)

(my-cpp-root-project
 "T*-tree"
 :name "T*-tree"
 :file "~/development/projects/ttree/CMakeLists.txt"
 :local-variables '((c-indentation-style . "default")
                    (compile-command . "cd build; make -j3")))

(my-cpp-root-project
 "pppd-ldap"
 :name "pppd-ldap"
 :file "~/work/altell/neo/vpn-ldap/pppd-ldap/Makefile"
 :local-variables '((coding-style . "bsd")
                    (c-basic-offset . 4)
                    (indent-tabs-mode . t)
                    (compile-command . "make all DESTDIR=/usr DEBUG=y CHAPMS=y MPPE=y")))

(my-linux-project
 "cryptodev-2.6"
 :name "cryptodev-2.6"
 :file "~/work/altell/cryptodev-2.6/Makefile"
 :local-variables '((coding-style . "linux-kernel")
                    (compile-command . "make -j3 bzImage"))
 :arch "x86")

(my-linux-project
 "linux-2.6"
 :name "linux-2.6"
 :file "~/work/altell/linux/linux-2.6/Makefile"
 :local-variables '((c-basic-offset . 8)
                    (c-tab-width . 8)
                    (tab-width . 8)
                    (coding-style . "linux")
                    (indent-tabs-mode . t)
                    (compile-command . "make -j3 bzImage"))
 :arch "x86")
