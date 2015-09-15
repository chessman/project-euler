(ns clj-test.core) 

(use 'clojure.contrib.math)

(defn gen-primes-map [n]
  (let [reduce-one-prime
        (fn [primes-map p]
          (if (contains? primes-map p)
            primes-map
            (reduce #(assoc %1 %2 false)
                    (assoc primes-map p true)
                    (range (* p 2) n p))))]
    (reduce reduce-one-prime
            (reduce-one-prime {} 2)
            (range 3 n 2))))

(def N (expt 10 7))
(def primes-map (gen-primes-map (* 2 (sqrt N))))
(def primes (filter primes-map (keys primes-map)))

(defn phi [p1 p2]
  (* (dec p1) (dec p2)))

(defn perm? [n]
  (apply =
         (map
           #(->> % (str)
                   (seq)
                   (frequencies)) n)))

(defn getf [n]
  (get n 1))

(->> (sort-by first
           (for [p1 primes
                 p2 (filter #(> % p1) primes)
                 :let [n (* p1 p2)
                       p (phi p1 p2)]
                 :when (and
                         (not= p1 p2)
                         (< (* p1 p2) N)
                         (perm? [n p]))]
             [(/ n p) n p]))
     (first)
     (#(get % 1))
     (println "Answer:"))

(defn -main []
)
