(ns echo.main
  (:gen-class))

(defn -main [& args]
  (apply println args))

