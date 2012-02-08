(let ((my-solaris-c-style
       '("bsd"
         (c-basic-offset                          . 8)
         (c-tab-width                             . 8)
         (tab-width                               . 8)
         (indent-tabs-mode                        . t)
         (c-offsets-alist                         . 
                          ((arglist-cont-nonempty . 4))))))
  (c-add-style "solaris" my-solaris-c-style))
