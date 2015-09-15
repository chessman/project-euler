(ns clj-test.core) 

(defn get-x [A]
  (A 0))

(defn get-y [A]
  (A 1))

(defn line [A B]
  (fn [[x y]]
    (+
      (* (- (get-y A) (get-y B)) x) 
      (* (- (get-x B) (get-x A)) y) 
      (- (* (get-x A) (get-y B)) (* (get-x B) (get-y A))))))

(defn same-half-plane? [l A B]
  (> (* (l A) (l B)) 0))

(defn triangle-contains-point? [A B C X]
  (let [lineA (line B C)
        lineB (line A C)
        lineC (line A B)]
    (and (same-half-plane? lineA A X)
         (same-half-plane? lineB B X)
         (same-half-plane? lineC C X))))

(defn str2vec [s]
  (vec (map read-string (clojure.string/split s #","))))

(with-open [rdr (clojure.java.io/reader "triangles.txt")]
  (loop [l (line-seq rdr)
         res 0]
    (if l
      (let [v (str2vec (first l))
            A [(v 0) (v 1)]
            B [(v 2) (v 3)]
            C [(v 4) (v 5)]]
        (if (triangle-contains-point? A B C [0 0])
          (recur (next l) (inc res))
          (recur (next l) res)))
      (println "Answer:" res))))


(defn -main []
)
