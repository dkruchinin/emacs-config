(let ((my-solaris-c-style
       '("bsd"
         (c-basic-offset                          . 4)
         (c-tab-width                             . 4)
         (tab-width                               . 4)
         (indent-tabs-mode                        . t)
         (c-offsets-alist                         . 
                          ((arglist-cont-nonempty . 4))))))
  (c-add-style "solaris" my-solaris-c-style))
