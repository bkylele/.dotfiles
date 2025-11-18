(list (channel
        (name 'guix)
        (url "https://git.guix.gnu.org/guix.git")
        (branch "master")
        (commit
          "acf6da0442043ba80e8c4d99f73914b0bc5c5b8c")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))

      (channel
        (name 'my-channel)
        (url (string-append "file://" (getenv "HOME") "/.dotfiles/custom"))))
