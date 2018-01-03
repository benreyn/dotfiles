(defconst nand2tetris-packages
  '(
    nand2tetris
    ))

(defun nand2tetris/init-nand2tetris ()
  (use-package nand2tetris
    :defer t
    :mode (("\\.hdl\\'" . nand2tetris-mode))
    :init
    (setq nand2tetris-core-base-dir "~/code/notebook/teach-yourself-cs/computer-architecture/nand2tetris")))
