(ns clj-test.core
  (:use [clojure.math.combinatorics])
  (:use [clojure.set]))
  
(def certainty 5)

(defn prime? [n]
  (.isProbablePrime (BigInteger/valueOf n) certainty)) 

(defmacro concat-int [a b]
  `(read-string (str ~a ~b)))

(defn gen-primes [to]
  (filter prime? (range to)))

(defn connected? [p1 p2]
  (and (prime? (concat-int p1 p2)) (prime? (concat-int p2 p1))))

(defn primes-connected-with [primes p]
  (set (filter (partial connected? p) primes)))

(defn connected-primes-map [primes]
  (into {} (map #(vector % (primes-connected-with primes %)) primes)))

(def primes-map 
      (connected-primes-map (gen-primes 10000)))

(def primes (set (keys primes-map)))

(defn filter-neighbours [graph X v]
  (intersection X (get graph v)))

(defn bron-kerbosch [graph clique-cb R P X]
  (if (and (empty? P) (empty? X))
    (clique-cb R)
    (loop [ P P
            X X ]
      (if-let [v (first P)]
        (do 
          (bron-kerbosch graph
                         clique-cb
                         (conj R v)
                         (filter-neighbours graph P v)
                         (filter-neighbours graph X v))
          (recur (disj P v)
                 (conj X v)))))))

(defn print-result [X]
  (if (= (count X) 5)
    (println "Answer:" (reduce + 0 X))))

(defn -main []
  (bron-kerbosch primes-map print-result #{} primes #{}))
